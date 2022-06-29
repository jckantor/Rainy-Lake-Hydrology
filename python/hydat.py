import sqlite3
import pandas as pd

class Hydat():
    
    def __init__(self, db="../../data/Hydat.sqlite3"):
        self.db = db
        self.con = sqlite3.connect(db)
    
    def info(self):
        cur = self.con.cursor()
        cur.execute('SELECT name from sqlite_master where type= "table"')
        return cur.fetchall()
    
    def get_stations(self, lat=None, lng=None):
        sql = "SELECT * from STATIONS"
        if lat:
            sql += f" WHERE LATITUDE >= {lat[0]} AND LATITUDE <= {lat[1]}"
        if lng:
            sql += f" AND LONGITUDE >= {lng[0]} AND LONGITUDE <= {lng[1]}"
        stations = pd.read_sql_query(sql, self.con)
        return stations
    
    def get_levels(self, station_number, start=None, end=None):
        sql = f"SELECT * from DLY_LEVELS WHERE STATION_NUMBER = '{station_number}'"
        if start:
            sql += f" AND YEAR >= {start}"
        if end:
            sql += f" AND YEAR <= {end}"
        df = pd.read_sql_query(sql, self.con)
        ts = dict()
        for k in df.index:
            mo = str(df.loc[k, 'MONTH'])
            yr = str(df.loc[k, 'YEAR'])
            for n in range(1, df.loc[k,'NO_DAYS'] + 1):
                date = pd.to_datetime('/'.join([mo, str(n), yr]))
                ts[date] = df.loc[k, 'LEVEL' + str(n)]  
        ts = pd.Series(ts)
        #drop initial and terminal null entries
        j = 0
        while j < len(ts.index) and pd.isnull(ts[j]):
            j += 1
        k = len(ts.index) - 1
        while k >= j and pd.isnull(ts[k]):
            k += -1
        return ts[j:k+1]
    
    def get_flows(self, station_number, start=None, end=None):
        sql = f"SELECT * from DLY_FLOWS WHERE STATION_NUMBER = '{station_number}'"
        if start:
            sql += f" AND YEAR >= {start}"
        if end:
            sql += f" AND YEAR <= {end}"
        df = pd.read_sql_query(sql, self.con)
        ts = dict()
        for k in df.index:
            mo = str(df.loc[k, 'MONTH'])
            yr = str(df.loc[k, 'YEAR'])
            for n in range(1, df.loc[k,'NO_DAYS'] + 1):
                date = pd.to_datetime('/'.join([mo, str(n), yr]))
                ts[date] = df.loc[k,'FLOW' + str(n)]  
        ts = pd.Series(ts)
        #drop initial and terminal null entries
        j = 0
        while j < len(ts.index) and pd.isnull(ts[j]):
            j += 1
        k = len(ts.index) - 1
        while k >= j and pd.isnull(ts[k]):
            k += -1
        return ts[j:k+1]
        
        
        
#level_stations = sorted(list(set(pd.read_sql_query("SELECT STATION_NUMBER FROM DLY_LEVELS", con)["STATION_NUMBER"])))
#level_stations = [station for station in stations["STATION_NUMBER"] if station in level_stations]

#flow_stations = sorted(list(set(pd.read_sql_query("SELECT STATION_NUMBER FROM DLY_FLOWS", con)["STATION_NUMBER"])))
#flow_stations = [station for station in stations["STATION_NUMBER"] if station in flow_stations]
