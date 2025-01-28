import sys
import csv
import gzip
import json
from datetime import date, datetime

from tqdm import tqdm

FILE = sys.argv[1]
BREAK = 0
if len(sys.argv) > 2:
    BREAK = int(sys.argv[2])
ARRAY_SEPARATOR = "§"
ARRAY_SEPARATOR_REPLACEMENT = "#"
TOTAL_LINES = 433_819_698

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
    "ad_delivery_duration_days",
    "estimated_audience_size_bounds",
    "impressions_bounds",
    "eu_total_reach",
    "lost",
    "spend_bounds",
    "currency",
    "beneficiary_payers",
    "demographic_distribution_percentage_for_female_13-17",
    "demographic_distribution_percentage_for_female_18-24",
    "demographic_distribution_percentage_for_female_25-34",
    "demographic_distribution_percentage_for_female_35-44",
    "demographic_distribution_percentage_for_female_45-54",
    "demographic_distribution_percentage_for_female_55-64",
    "demographic_distribution_percentage_for_female_65+",
    "demographic_distribution_percentage_for_female_Unknown",
    "demographic_distribution_percentage_for_male_13-17",
    "demographic_distribution_percentage_for_male_18-24",
    "demographic_distribution_percentage_for_male_25-34",
    "demographic_distribution_percentage_for_male_35-44",
    "demographic_distribution_percentage_for_male_45-54",
    "demographic_distribution_percentage_for_male_55-64",
    "demographic_distribution_percentage_for_male_65+",
    "demographic_distribution_percentage_for_male_Unknown",
    "demographic_distribution_percentage_for_unknown_13-17",
    "demographic_distribution_percentage_for_unknown_18-24",
    "demographic_distribution_percentage_for_unknown_25-34",
    "demographic_distribution_percentage_for_unknown_35-44",
    "demographic_distribution_percentage_for_unknown_45-54",
    "demographic_distribution_percentage_for_unknown_55-64",
    "demographic_distribution_percentage_for_unknown_65+",
    "demographic_distribution_percentage_for_unknown_Unknown",
    "demographic_distribution_percentage_for_All (Automated App Ads)_13-17",
    "demographic_distribution_percentage_for_All (Automated App Ads)_18-24",
    "demographic_distribution_percentage_for_All (Automated App Ads)_25-34",
    "demographic_distribution_percentage_for_All (Automated App Ads)_45-54",
    "demographic_distribution_percentage_for_All (Automated App Ads)_55-64",
    "demographic_distribution_percentage_for_All (Automated App Ads)_65+",
    "demographic_distribution_percentage_for_All (Automated App Ads)_All (Automated App Ads)",
    "demographic_distribution_percentage",
    "age_country_gender_reach_breakdown",
    "target_ages",
    "target_gender",
    "target_locations",
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

        elif key == "eu_total_reach":
            res.append(line.get("eu_total_reach", {}).get("$numberInt", ""))

        elif key == "last_updated":
            ts = line.get("_last_updated", {}).get("$date", {}).get("$numberLong", "")
            if ts:
                ts = int(ts) / 1000
                ts = datetime.fromtimestamp(ts).isoformat()
            res.append(ts)

        elif key == "ad_delivery_duration_days":
            t0 = line.get("ad_delivery_start_time", "")
            t1 = line.get("ad_delivery_stop_time", "")
            days = ""
            if t0 and t1:
                t0 = date(*[int(x) for x in t0.split("-")])
                t1 = date(*[int(x) for x in t1.split("-")])
                days = (t1 - t0).days + 1
            res.append(days)

        elif key.endswith("_bounds"):
            k = "_".join(key.split("_")[:-1])
            low = line.get(k, {}).get("lower_bound", "")
            upp = line.get(k, {}).get("upper_bound", "")
            res.append("%s - %s" % (low, upp))

        elif key.startswith("demographic_distribution"):
            res.append(demog.get(key, ""))

        elif key in ["delivery_by_region", "age_country_gender_reach_breakdown", "beneficiary_payers", "target_locations"]:
            res.append(json.dumps(line.get(key)))

        else:
            val = line.get(key, "")
            if type(val) == list:
                val = ARRAY_SEPARATOR.join([v.strip().replace(ARRAY_SEPARATOR, ARRAY_SEPARATOR_REPLACEMENT) for v in val])
            res.append(val)

    return res


writer = csv.writer(sys.stdout)
writer.writerow(HEADERS)
with gzip.open(FILE, mode='rt') as f:
    count = 0
    for line in tqdm(f, total=(BREAK or TOTAL_LINES)):
        jsonline = json.loads(line)
        res = convert_line(jsonline)
        writer.writerow(res)
        count += 1
        if count == BREAK:
            break
