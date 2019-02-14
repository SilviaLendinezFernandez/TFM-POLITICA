import pandas as pd
df_2 = pd.read_csv('TaxiModelos.csv' , encoding = 'latin-1', sep = ";")
df_2.head(10)

------

# 1. Renombrar columnas 
# 1.1 Cambiar los títulos a minúsculas

df_2.columns = df_2.columns.str.lower()

# 1.2 Sustituir espacios por "_"
df_2.columns = df_2.columns.str.replace(' ','_')


# 1.3 Quitar tildes
df_2.columns = df_2.columns.str.replace("á", "a").str.replace("é", "e").str.replace("í", "i").str.replace("ó", "o").str.replace("ú", "u").str.replace("ñ", "n")

# 1.4 Renombrar manualmente las columnas con nombres más largos
df_2 = df_2.rename(columns= {'contrasena_de_homologacion':'constrasena_homologacion',
                   'tipo_de_cambio':'tipo_cambio', 
                   'nº_plazas':'n_plazas', 
                   'mampara_s/n':'mampara', 
                   'comercializado_s/n':'comercializado',
                   'clasificacion_d.g.t.':'clasificacion_dgt'})

# 1.5 Comprobar nombre de columnas
df_2.columns

-------
# 2. Convertir variables
# 2.1 Inspeccionar el tipo de variables
df_2.dtypes
------
# 2.2 Identificar las variables a cambiar
# marca -> OK
------
# modelo -> OK
------
# tipo -> OK
------
# contrasena_homologacion -> OK
------
# variante -> OK
------
# version -> OK
------
# parte_fija_vin -> OK
------
# combustible -> OK
------
# eurotaxi -> OK (cambiar si y no por 1 y 0)
df_2.eurotaxi = df_2.eurotaxi.replace('SI','1')
df_2.eurotaxi = df_2.eurotaxi.replace('NO','0')
------
# cilindrada -> OK
------
# potencia -> OK
------
# tipo_cambio -> OK
------
# n_plazas -> cambiar
------
# mampara -> OK (cambiar si y no por 1 y 0)
df_2.mampara = df_2.mampara.replace('SI','1')
df_2.mampara = df_2.mampara.replace('NO','0')
------
# comercializado -> OK (cambiar si y no por 1 y 0)
df_2.comercializado = df_2.comercializado.replace('SI','1')
df_2.comercializado = df_2.comercializado.replace('NO','0')
------
# clasificacion_medioambiental -> category
df_2["clasificacion_dgt"] = pd.Categorical(df_2["clasificacion_dgt"], ["0", "Eco", "C", "B"])
df_2["clasificacion_dgt"].head()
------
# 2.3 Confirmar cambios
df_2.dtypes