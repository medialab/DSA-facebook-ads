import sys
import csv
import gzip
import json
from collections import defaultdict,Counter

#import networkx as nx
from tqdm import tqdm

FILE = sys.argv[1]
BREAK = 0
if len(sys.argv) > 2:
    BREAK = int(sys.argv[2])
ARRAY_SEPARATOR = "§"
TOTAL_LINES = 433_819_698

columns_tree = {}
regions = Counter()
#regions_network = nx.Graph()
#regions_network = defaultdict(Counter)
#NETWORK_LINKS_WEIGHT_THRESHOLD = 100


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
        elif isinstance(v, bool):
            add_to_tree(full_key, "bool")
        elif isinstance(v, list):
            arr_typ = type(v[0]).__name__
            if arr_typ == "str":
                #for el in v:
                #    if ARRAY_SEPARATOR in el:
                #        print("WARNING: %s in found string of an array:" % ARRAY_SEPARATOR, k, el, file=sys.stderr)
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
                    add_to_tree(full_key, "dict_array", len(v))
                    #done_regions = []
                    for d in v:
                        if d.get("percentage") == "1" and ("region" not in d):
                            reg = ""
                        elif "region" not in d or "percentage" not in d:
                            print("WARNING: missing fields in demographic_distribution element:", dic, file=sys.stderr)
                            sys.exit(1)
                        else:
                            reg = d["region"]
                        regions[reg] += 1
                        #if not regions_network.has_node(reg):
                        #    regions_network.add_node(reg)
                        #for r2 in done_regions:
                        #    sortednames = sorted([reg, r2])
                        #    if not regions_network.has_edge(reg, r2):
                        #        regions_network.add_edge(reg, r2, weight=1)
                        #    else:
                        #        regions_network[reg][r2]["weight"] += 1
                        #    regions_network[sortednames[0]][sortednames[1]] += 1
                        #done_regions.append(reg)
                else:
                    for d in v:
                        depile_json(d, full_key + ["FOR"])
            else:
                print("WARNING: ARRAY TYPE NOT HANDLED:", k, arr_type, v, file=sys.stderr)
                sys.exit(1)
        elif isinstance(v, dict):
            depile_json(v, full_key)
        else:
            print("WARNING: TYPE NOT HANDLED:", k, type(v).__name__, v, dic, file=sys.stderr)
            sys.exit(1)

with gzip.open(FILE, mode='rt') as f:
    count = 0
    for line in tqdm(f, total=(BREAK or TOTAL_LINES)):
        jsonline = json.loads(line)
        depile_json(jsonline)
        count += 1
        if count == BREAK:
            break

OUTF = FILE.replace(".json.gz", "_first_%s_lines" % BREAK if BREAK else "")

with open(OUTF + ".datastructure.json", "w") as f:
    json.dump(columns_tree, f, indent=4, sort_keys=True)

with open(OUTF + ".regions.csv", "w") as f:
    regions_csv = csv.writer(f)
    regions_csv.writerow(["region", "count"])
    for r, c in regions.items():
        regions_csv.writerow([r, c])

#filtered_network = nx.subgraph_view(regions_network, filter_edge=lambda x, y: regions_network[x][y]["weight"] > NETWORK_LINKS_WEIGHT_THRESHOLD)
#nx.write_gexf(filtered_network, OUTF + ".regions_network_filtered_%s.gexf" % NETWORK_LINKS_WEIGHT_THRESHOLD)
#nx.write_gexf(regions_network, OUTF + ".regions_network_full.gexf.gz")
#with open(OUTF + ".regions_links_full.csv", "w") as full:
#    with open(OUTF + ".regions_links_filtered_%s.csv" % NETWORK_LINKS_WEIGHT_THRESHOLD, "w") as filtered:
#        fullwriter = csv.writer(full)
#        filtwriter = csv.writer(filtered)
#        fullwriter.writerow(["source", "target", "weight"])
#        filtwriter.writerow(["source", "target", "weight"])
#        for r1, linked in regions_network.items():
#            for r2, w in linked.items():
#                fullwriter.writerow([r1, r2, w])
#                if w > NETWORK_LINKS_WEIGHT_THRESHOLD:
#                    filtwriter.writerow([r1, r2, w])
