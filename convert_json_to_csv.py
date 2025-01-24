import sys
import csv
import gzip
import json

FILE = sys.argv[1]
BREAK = 0
if len(sys.argv) > 2:
    BREAK = int(sys.argv[2])
ARRAY_SEPARATOR = "§"

HEADERS = [
    "id",
    "page_id",
    "page_name",
    "publisher_platforms",
    "languages",
    "bylines",
    "ad_creative_bodies",
    "ad_creative_link_titles",
    "ad_creative_link_descriptions",
    "ad_creative_link_captions",
    "ad_creation_time",
    "ad_delivery_start_time",
    "ad_delivery_stop_time",
    "estimated_audience_size lower_bound",
    "estimated_audience_size upper_bound",
    "impressions lower_bound",
    "impressions upper_bound",
    "spend lower_bound",
    "spend upper_bound",
    "currency",
    "demographic_distribution_percentage_for_female_13-17",
    "demographic_distribution_percentage_for_female_18-24",
    "demographic_distribution_percentage_for_female_25-34",
    "demographic_distribution_percentage_for_female_35-44",
    "demographic_distribution_percentage_for_female_45-54",
    "demographic_distribution_percentage_for_female_55-64",
    "demographic_distribution_percentage_for_female_65+",
    "demographic_distribution_percentage_for_male_13-17",
    "demographic_distribution_percentage_for_male_18-24",
    "demographic_distribution_percentage_for_male_25-34",
    "demographic_distribution_percentage_for_male_35-44",
    "demographic_distribution_percentage_for_male_45-54",
    "demographic_distribution_percentage_for_male_55-64",
    "demographic_distribution_percentage_for_male_65+",
    "demographic_distribution_percentage_for_unknown_13-17",
    "demographic_distribution_percentage_for_unknown_18-24",
    "demographic_distribution_percentage_for_unknown_25-34",
    "demographic_distribution_percentage_for_unknown_35-44",
    "demographic_distribution_percentage_for_unknown_45-54",
    "demographic_distribution_percentage_for_unknown_55-64",
    "demographic_distribution_percentage_for_unknown_65+",
    "demographic_distribution_percentage_for_unknown_Unknown",
    "demographic_distribution_percentage",
    "delivery_by_region",
    "last_updated"
]

def convert_line(line):
    res = []

    demog = {}
    for val in line.get("demographic_distribution", []):
        if "gender" in val and "age" in val:
            demog["demographic_distribution_percentage_for_%s_%s" % (val["gender"], val["age"])] = val["percentage"]
        else:
            demog["demographic_distribution_percentage"] = val["percentage"]

    for key in HEADERS:
        if key == "id":
            res.append(line.get("_id"))

        elif key == "last_updated":
            res.append(line.get("_last_updated", {}).get("$date", {}).get("$numberLong", ""))

        elif key.endswith("_bound"):
            key1, key2 = key.split(" ")
            res.append(line.get(key1, {}).get(key2, ""))

        elif key.startswith("demographic_distribution"):
            res.append(demog.get(key, ""))

        elif key == "delivery_by_region":
            res.append(json.dumps(line.get("delivery_by_region")))

        else:
            val = line.get(key, "")
            if type(val) == list:
                val = ARRAY_SEPARATOR.join([v.strip() for v in val])
            res.append(val)

    return res


writer = csv.writer(sys.stdout)
writer.writerow(HEADERS)
with gzip.open(FILE, mode='rt') as f:
    count = 0
    for line in f:
        jsonline = json.loads(line)
        res = convert_line(jsonline)
        writer.writerow(res)
        count += 1
        if count == BREAK:
            break
