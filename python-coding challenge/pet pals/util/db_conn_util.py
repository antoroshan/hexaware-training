import pyodbc
from util.db_property_util import get_connection_string

def get_connection():
    conn_str = get_connection_string('db_config.properties')
    return pyodbc.connect(conn_str)
