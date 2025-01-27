import sys
import gzip
import json

FILE = sys.argv[1]
BREAK = 0
if len(sys.argv) > 2:
    BREAK = int(sys.argv[2])
ARRAY_SEPARATOR = "§"

columns_tree = {}

def add_to_tree(key, typ, arr_len=None):
    keystr = "/".join(key)
    if keystr not in columns_tree:
        columns_tree[keystr] = {
            "type": typ,
            "count": 1
        }
        if typ.endswith("_array"):
            columns_tree[keystr]["max_length"] = arr_len
    elif columns_tree[keystr]["type"] != typ:
        print("WARNING: DIFFERENT TYPES ENCOUNTERED FOR KEY:", keystr, typ, columns_tree[keystr]["type"], file=sys.stderr)
        sys.exit(1)
    else:
        columns_tree[keystr]["count"] += 1
        if typ.endswith("_array") and arr_len > columns_tree[keystr]["max_length"]:
            columns_tree[keystr]["max_length"] = arr_len

def depile_json(dic, prefix=[]):
    for k, v in dic.items():
        full_key = prefix + [k]
        if isinstance(v, str):
            add_to_tree(full_key, "str")
        elif isinstance(v, list):
            arr_typ = type(v[0]).__name__
            if arr_typ == "str":
                for el in v:
                    if ARRAY_SEPARATOR in el:
                        print("WARNING: %s in found string of an array:" % ARRAY_SEPARATOR, k, v, file=sys.stderr)
                add_to_tree(full_key, "str_array", len(v))
            elif arr_typ == "dict":
                if k == "demographic_distribution":
                    for d in v:
                        if d.get("percentage") == "1" and ("gender" not in d or "age" not in d):
                            add_to_tree(prefix + [k + "_percentage"], type(d["percentage"]).__name__)
                        elif "gender" not in d or "age" not in d or "percentage" not in d:
                            print("WARNING: missing fields in demographic_distribution element:", dic, file=sys.stderr)
                            sys.exit(1)
                        else:
                            add_to_tree(prefix + [k + "_percentage_for_" + d["gender"] + "_"  + d["age"]], type(d["percentage"]).__name__)
                elif k == "delivery_by_region":
                    for d in v:
                        if d.get("percentage") == "1" and ("region" not in d):
                            add_to_tree(prefix + [k + "_percentage"], type(d["percentage"]).__name__)
                        elif "region" not in d or "percentage" not in d:
                            print("WARNING: missing fields in demographic_distribution element:", dic, file=sys.stderr)
                            sys.exit(1)
                        else:
                            add_to_tree(prefix + [k + "_percentage_for_" + d["region"]], type(d["percentage"]).__name__)
                else:
                    for d in v:
                        depile_json(d, full_key + ["FOR"])
            else:
                print("WARNING: ARRAY TYPE NOT HANDLED:", k, arr_type, v, file=sys.stderr)
                sys.exit(1)
        elif isinstance(v, dict):
            depile_json(v, full_key)
        else:
            print("WARNING: TYPE NOT HANDLED:", k, type(v).__name__, v, file=sys.stderr)
            sys.exit(1)

with gzip.open(FILE, mode='rt') as f:
    count = 0
    for line in f:
        jsonline = json.loads(line)
        depile_json(jsonline)
        count += 1
        if count == BREAK:
            break

from pprint import pprint
pprint(columns_tree)

with open(FILE + ".datastructure" +  ("_first_%s_lines" % BREAK if BREAK else ""), "w") as f:
    json.dump(columns_tree, f, indent=4, sort_keys=True)
