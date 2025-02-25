# Filter year 2024:

xan search -s ad_delivery_start_time "2024" ads-FR-fr.csv.gz | gzip > ads-FR-fr-2024.csv.gz


# Count year 2024 fr
xan count ads-FR-fr-2024.csv.gz
# 15 185 568


# Histogram by month
xan transform ad_delivery_start_time year_month ads-FR-fr-2024.csv.gz | xan freq -s ad_delivery_start_time -A | xan hist -D --cols 80

# Histogram for ad_delivery_start_time (bars: 11, sum: 15,185,568, max: 1,699,359):
# 
# 2024-01 |1,313,772   8.65%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■           |
# 2024-02 |1,253,688   8.26%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■             |
# 2024-03 |1,483,592   9.77%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■      |
# 2024-04 |1,575,851  10.38%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   |
# 2024-05 |1,633,845  10.76%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  |
# 2024-06 |1,652,497  10.88%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ |
# 2024-07 |1,602,610  10.55%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  |
# 2024-08 |1,282,647   8.45%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■            |
# 2024-09 |1,599,975  10.54%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   |
# 2024-10 |1,699,359  11.19%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■|
# 2024-11 |   87,732   0.58%|■■■                                                 |


# Top 50 pages in number of ads:
xan freq -s page_name ads-FR-fr-2024.csv.gz -l 50 | xan hist --cols 80

# Histogram for page_name (bars: 51, sum: 15,185,568, max: 13,709,020):
# 
# GiFi                         |   346,332   2.28%|■                             |
# Carrefour Market             |   148,428   0.98%|■                             |
# Temu France                  |   142,323   0.94%|■                             |
# Histoires de Joie            |    30,711   0.20%|■                             |
# Carrefour                    |    30,610   0.20%|■                             |
# SurveyWorld                  |    30,046   0.20%|■                             |
# SHORT TV                     |    29,387   0.19%|■                             |
# Cuisines AvivA               |    25,225   0.17%|■                             |
# Cettesaison                  |    24,993   0.16%|■                             |
# Soufeel Europe               |    24,688   0.16%|■                             |
# SHEIN                        |    23,744   0.16%|■                             |
# Monster                      |    23,734   0.16%|■                             |
# Mad Muscles                  |    23,079   0.15%|■                             |
# Candlelight Concerts by Fev… |    22,269   0.15%|■                             |
# Lidl France                  |    21,080   0.14%|■                             |
# Feu Vert                     |    20,914   0.14%|■                             |
# Yoga-Go: Yoga For Weight Lo… |    20,784   0.14%|■                             |
# MaSelectionimmo - Programme… |    20,750   0.14%|■                             |
# BUT                          |    20,278   0.13%|■                             |
# Dyson                        |    19,719   0.13%|■                             |
# Intermarché                  |    19,517   0.13%|■                             |
# Cash Piscines                |    19,452   0.13%|■                             |
# UniMeal: Plan de comidas ef… |    19,360   0.13%|■                             |
# Mes-looks-C                  |    19,194   0.13%|■                             |
# MaSelectionimmo - Premium    |    18,950   0.12%|■                             |
# Shoptemu                     |    18,451   0.12%|■                             |
# JoyReels                     |    17,586   0.12%|■                             |
# Mon Avis Compte              |    16,386   0.11%|■                             |
# Brico Dépôt                  |    15,444   0.10%|■                             |
# Atol Mon Opticien            |    15,198   0.10%|■                             |
# MG Motor France              |    15,109   0.10%|■                             |
# INTERSPORT France            |    14,876   0.10%|■                             |
# Netto France                 |    14,749   0.10%|■                             |
# Investing Hebdo              |    14,131   0.09%|■                             |
# ReelShort                    |    13,760   0.09%|■                             |
# Krys                         |    13,518   0.09%|■                             |
# Bebes et Mamans              |    13,095   0.09%|■                             |
# Lecture des Romans Populair… |    12,826   0.08%|■                             |
# Mon avis                     |    12,795   0.08%|■                             |
# MaSelectionimmo - Logement … |    12,540   0.08%|■                             |
# Mon Resto Gratuit            |    11,842   0.08%|■                             |
# Tori Repa                    |    11,739   0.08%|■                             |
# L’hebdo par Investing        |    11,676   0.08%|■                             |
# Omo - Weight Loss With Psyc… |    11,320   0.07%|■                             |
# Romans populaires            |    11,079   0.07%|■                             |
# Arkana Living                |    10,838   0.07%|■                             |
# Mr.Bricolage                 |    10,549   0.07%|■                             |
# Episto                       |    10,519   0.07%|■                             |
# ShineHair Perruque           |    10,500   0.07%|■                             |
# Nature's Finest France       |    10,455   0.07%|■                             |
# <rest>                       |13,709,020  90.28%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■|


# Split bound bins into min/max

xan select -eA 'max(1, split(spend_bounds, " -")[0] or 0) as spend_min, split(spend_bounds, "- ")[1] as spend_max' ads-FR-fr-2024.csv.gz |
 xan select -eA 'max(1, split(estimated_audience_size_bounds, " -")[0] or 0) as estimated_audience_size_min, split(estimated_audience_size_bounds, "- ")[1] as estimated_audience_size_max' |
 xan select -eA 'max(1, split(impressions_bounds, " -")[0] or 0) as impressions_min, split(impressions_bounds, "- ")[1] as impressions_max' | gzip > ads-FR-fr-2024-splitbounds.csv.gz


# Filter political ads and non political ones:

xan search -s bylines -N ads-FR-fr-2024-splitbounds.csv.gz | gzip > ads-FR-fr-2024-political.csv.gz
xan search -s bylines -E ads-FR-fr-2024-splitbounds.csv.gz | gzip > ads-FR-fr-2024-nonpolitical.csv.gz




# Promenade on "political" ones:

## Top 50 political emitters



## Check currencies


## -> Euro, CHF, USD & CAD are very close, so we'll assume for now everything's in €

## Top by min/max spent 

