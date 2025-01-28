# DSA Ads data

## Data source and documentation:

https://github.com/Lejo1/facebook_ad_library


## Data conversion and preparation:

### Install bsondump:

```bash
wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-amazon2-x86_64-100.10.0.tgz
tar -xzvf mongodb-database-tools-amazon2-x86_64-100.10.0.tgz
export PATH="$(pwd)/mongodb-database-tools-amazon2-x86_64-100.10.0/bin:$PATH"
```


### Convert bson.gz files to json:

```bash
zcat ads.bson.gz | bsondump -vvvvv --type=json | gzip > ads.json.gz
```

### Install python dependencies:

(Ideally in a dedicated Python environment)

```bash
pip install -r requirements.txt
```


### Analyze keys structure of the json:

```bash
python analyze_data_structure.py ads.json.gz
```

Or add an extra integer <N> argument to run only on first N rows, for instance:

```bash
python analyze_data_structure.py ads.json.gz 1000000
```

Returns 2 files (possibly named `ads_first_N_lines` when relevant):

- [`ads.json.gz.datastructure.json`](ads.json.gz.datastructure.json): a json of all useful fields wih counts and natures
- [`ads.json.gz.regions.csv`](ads.json.gz.regions.csv): a csv with all delivery regions with counts


### Convert json to csv:

```bash
python convert_json_to_csv.py ads.json.gz | gzip > ads.csv.gz
```

Or add an extra integer <N> argument to run only on first N rows, for instance:

```bash
python convert_json_to_csv.py ads.json.gz 1000000 > ads_first_1000000_lines.csv
```


