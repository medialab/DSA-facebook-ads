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

## Top 50 political emitters by number of ads

xan freq -s page_name ads-FR-fr-2024-political.csv.gz -l 50 | xan hist --cols 80

Histogram for page_name (bars: 51, sum: 38,614, max: 15,794):
# 
# Mediapart                    | 2,991   7.75%|■■■■■■■                           |
# Challenges                   | 2,900   7.51%|■■■■■■■                           |
# Amnesty International France | 1,649   4.27%|■■■■                              |
# Mon avis citoyen             | 1,335   3.46%|■■■                               |
# Rassemblement National       | 1,176   3.05%|■■■                               |
# ENGIE                        |   803   2.08%|■■                                |
# Greenpeace France            |   668   1.73%|■■                                |
# Action Education             |   576   1.49%|■■                                |
# Oxfam France                 |   521   1.35%|■■                                |
# Fepem - Fédération des part… |   518   1.34%|■■                                |
# Vaincre la Mucoviscidose     |   505   1.31%|■■                                |
# Fondation pour la Nature et… |   497   1.29%|■■                                |
# Mes Soutiens                 |   475   1.23%|■■                                |
# UNHCR France                 |   393   1.02%|■                                 |
# au courant                   |   330   0.85%|■                                 |
# Chez Nous                    |   320   0.83%|■                                 |
# QUATRE PATTES                |   318   0.82%|■                                 |
# Franceemploidomicile         |   308   0.80%|■                                 |
# LEON le média                |   285   0.74%|■                                 |
# Les Petits Frères des Pauvr… |   277   0.72%|■                                 |
# ifaw                         |   272   0.70%|■                                 |
# DIGNITE international        |   255   0.66%|■                                 |
# Lifeaz                       |   254   0.66%|■                                 |
# ImmoPotam                    |   249   0.64%|■                                 |
# Tilt                         |   248   0.64%|■                                 |
# Fondation Raoul Follereau    |   247   0.64%|■                                 |
# Libération                   |   230   0.60%|■                                 |
# Fondation Perce-Neige        |   227   0.59%|■                                 |
# Welfarm                      |   227   0.59%|■                                 |
# CIWF France                  |   218   0.56%|■                                 |
# Action Education - en franç… |   217   0.56%|■                                 |
# Mon épargne et moi           |   216   0.56%|■                                 |
# Réel média                   |   215   0.56%|■                                 |
# Handicap International - Hu… |   206   0.53%|■                                 |
# CCFD-Terre Solidaire         |   200   0.52%|■                                 |
# Actu-Juridique.fr            |   191   0.49%|■                                 |
# Apprentis d'Auteuil          |   189   0.49%|■                                 |
# Plan International France    |   189   0.49%|■                                 |
# Make.org                     |   186   0.48%|■                                 |
# Emmaüs France                |   185   0.48%|■                                 |
# Tournée du Climat et de la … |   178   0.46%|■                                 |
# Oikocredit France            |   160   0.41%|■                                 |
# Institut Pasteur             |   157   0.41%|■                                 |
# Anne-Sophie Frigout          |   156   0.40%|■                                 |
# APF France handicap          |   154   0.40%|■                                 |
# GRDF Occitanie et Nouvelle-… |   152   0.39%|■                                 |
# Réseau Action Climat         |   152   0.39%|■                                 |
# TotalEnergies                |   151   0.39%|■                                 |
# Veolia France                |   148   0.38%|■                                 |
# Fondation ARC pour la reche… |   146   0.38%|■                                 |
# <rest>                       |15,794  40.90%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■|


## Check currencies

xan freq -s currency ads-FR-fr-2024-political.csv.gz -A | xan hist --cols 80

# Histogram for currency (bars: 4, sum: 38,614, max: 38,139):
#   
# EUR |38,139  98.77%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■|
# CHF |   454   1.18%|■                                                          |
# USD |    15   0.04%|■                                                          |
# CAD |     6   0.02%|■                                                          |

# -> Euro, CHF, USD & CAD are very close, so we'll assume for now everything's in €


## Top by min/max spent 

xan groupby page_id,page_name 'sum(spend_min) as total_spend_min, sum(spend_max) as total_spend_max' ads-FR-fr-2024-political.csv.gz | xan sort -s total_spend_min -NR | xan slice -e 50 | xan hist -l page_name -v total_spend_min --cols 80

# Histogram for unknown (bars: 50, sum: 2,863,653, max: 464,240):
# 
# Greenpeace France            |464,240  16.21%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■|
# EU Civil Protection & Human… |189,500   6.62%|■■■■■■■■■■■■■■                   |
# European Parliament          |148,719   5.19%|■■■■■■■■■■■                      |
# Mars, Incorporated           |141,300   4.93%|■■■■■■■■■■■                      |
# Amnesty International France |107,998   3.77%|■■■■■■■■                         |
# UNICEF France                | 85,428   2.98%|■■■■■■■                          |
# Oxfam France                 | 82,701   2.89%|■■■■■■                           |
# Région Ile-de-France         | 78,802   2.75%|■■■■■■                           |
# Ministère Écologie Territoi… | 76,500   2.67%|■■■■■■                           |
# DIGNITE international        | 74,054   2.59%|■■■■■■                           |
# Médecins Sans Frontières / … | 70,884   2.48%|■■■■■■                           |
# Challenges                   | 70,147   2.45%|■■■■■                            |
# EU Social                    | 69,100   2.41%|■■■■■                            |
# QUATRE PATTES                | 58,005   2.03%|■■■■■                            |
# Gouvernement                 | 51,515   1.80%|■■■■                             |
# Institut du Cerveau - Paris… | 50,539   1.76%|■■■■                             |
# au courant                   | 48,013   1.68%|■■■■                             |
# CIWF France                  | 45,725   1.60%|■■■■                             |
# Action Education             | 44,601   1.56%|■■■■                             |
# Les Engagés - Mouvement par… | 44,123   1.54%|■■■■                             |
# La France aux urnes          | 43,313   1.51%|■■■■                             |
# Les Petits Frères des Pauvr… | 40,689   1.42%|■■■                              |
# ifaw                         | 40,385   1.41%|■■■                              |
# La SPA - Société Protectric… | 39,752   1.39%|■■■                              |
# UNHCR France                 | 38,880   1.36%|■■■                              |
# EU Justice and Consumers     | 37,222   1.30%|■■■                              |
# Mediapart                    | 36,477   1.27%|■■■                              |
# Syndicat CFTC                | 35,903   1.25%|■■■                              |
# Veolia France                | 35,309   1.23%|■■■                              |
# Ben & Jerry's                | 34,838   1.22%|■■■                              |
# Le Jour du Seigneur          | 34,639   1.21%|■■■                              |
# Fondation ARC pour la reche… | 31,406   1.10%|■■■                              |
# Libération                   | 31,236   1.09%|■■■                              |
# Diffuz Solidaire             | 27,013   0.94%|■■                               |
# Association pour le Droit d… | 25,933   0.91%|■■                               |
# Handicap International - Hu… | 25,065   0.88%|■■                               |
# World Vision France          | 24,232   0.85%|■■                               |
# France Nature Environnement  | 24,212   0.85%|■■                               |
# GAIA - Global Action in the… | 23,605   0.82%|■■                               |
# La Dianétique - France       | 23,043   0.80%|■■                               |
# MAIF                         | 22,905   0.80%|■■                               |
# ENGIE                        | 22,775   0.80%|■■                               |
# TotalEnergies                | 22,653   0.79%|■■                               |
# Secours populaire            | 22,139   0.77%|■■                               |
# Georges-Louis Bouchez        | 20,400   0.71%|■■                               |
# La Cimade                    | 19,925   0.70%|■■                               |
# GRDF                         | 19,800   0.69%|■■                               |
# Ma Voix, Mon Choix           | 19,783   0.69%|■■                               |
# Fondation pour la Nature et… | 19,329   0.67%|■■                               |
# Donnez de la Voix            | 18,898   0.66%|■■                               |

xan groupby page_id,page_name 'sum(spend_min) as total_spend_min, sum(spend_max) as total_spend_max' ads-FR-fr-2024-political.csv.gz | xan sort -s total_spend_max -NR | xan slice -e 50 | xan hist -l page_name -v total_spend_max --cols 80

# Histogram for unknown (bars: 50, sum: 5,144,603, max: 617,632):
# 
# Greenpeace France            |617,632  12.01%|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■|
# Challenges                   |359,000   6.98%|■■■■■■■■■■■■■■■■■■■■             |
# Mediapart                    |330,909   6.43%|■■■■■■■■■■■■■■■■■■               |
# Amnesty International France |278,851   5.42%|■■■■■■■■■■■■■■■                  |
# EU Civil Protection & Human… |237,990   4.63%|■■■■■■■■■■■■■                    |
# European Parliament          |182,211   3.54%|■■■■■■■■■■                       |
# Mars, Incorporated           |175,586   3.41%|■■■■■■■■■■                       |
# Oxfam France                 |149,479   2.91%|■■■■■■■■                         |
# Mon avis citoyen             |132,165   2.57%|■■■■■■■■                         |
# Rassemblement National       |121,724   2.37%|■■■■■■■                          |
# DIGNITE international        |108,045   2.10%|■■■■■■                           |
# Action Education             |107,524   2.09%|■■■■■■                           |
# UNICEF France                |107,493   2.09%|■■■■■■                           |
# ENGIE                        |100,017   1.94%|■■■■■■                           |
# Ministère Écologie Territoi… | 98,680   1.92%|■■■■■■                           |
# Médecins Sans Frontières / … | 97,657   1.90%|■■■■■■                           |
# QUATRE PATTES                | 96,582   1.88%|■■■■■■                           |
# Région Ile-de-France         | 93,162   1.81%|■■■■■                            |
# au courant                   | 89,270   1.74%|■■■■■                            |
# EU Social                    | 82,378   1.60%|■■■■■                            |
# UNHCR France                 | 79,507   1.55%|■■■■■                            |
# Les Petits Frères des Pauvr… | 73,123   1.42%|■■■■                             |
# CIWF France                  | 72,482   1.41%|■■■■                             |
# ifaw                         | 71,528   1.39%|■■■■                             |
# Fondation pour la Nature et… | 68,903   1.34%|■■■■                             |
# Institut du Cerveau - Paris… | 68,206   1.33%|■■■■                             |
# Vaincre la Mucoviscidose     | 66,895   1.30%|■■■■                             |
# Mes Soutiens                 | 65,425   1.27%|■■■■                             |
# Gouvernement                 | 64,157   1.25%|■■■■                             |
# Les Engagés - Mouvement par… | 59,996   1.17%|■■■■                             |
# Libération                   | 56,670   1.10%|■■■■                             |
# La SPA - Société Protectric… | 55,477   1.08%|■■■                              |
# Veolia France                | 54,652   1.06%|■■■                              |
# La France aux urnes          | 54,355   1.06%|■■■                              |
# Fepem - Fédération des part… | 53,082   1.03%|■■■                              |
# Fondation ARC pour la reche… | 49,754   0.97%|■■■                              |
# Handicap International - Hu… | 48,594   0.94%|■■■                              |
# Le Jour du Seigneur          | 48,204   0.94%|■■■                              |
# EU Justice and Consumers     | 47,055   0.91%|■■■                              |
# Ben & Jerry's                | 46,031   0.89%|■■■                              |
# Syndicat CFTC                | 44,224   0.86%|■■■                              |
# Fondation Raoul Follereau    | 39,653   0.77%|■■■                              |
# TotalEnergies                | 39,149   0.76%|■■■                              |
# Diffuz Solidaire             | 36,672   0.71%|■■                               |
# Tilt                         | 36,652   0.71%|■■                               |
# Plan International France    | 36,611   0.71%|■■                               |
# Donnez de la Voix            | 35,967   0.70%|■■                               |
# Make.org                     | 35,414   0.69%|■■                               |
# Franceemploidomicile         | 34,992   0.68%|■■                               |
# World Vision France          | 34,818   0.68%|■■                               |

