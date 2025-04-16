def get_connection_string(file_path):
    props = {}
    with open(file_path) as f:
        for line in f:
            if "=" in line:
                key, value = line.strip().split("=")
                props[key.strip()] = value.strip()
    
    if 'TRUSTED_CONNECTION' in props and props['TRUSTED_CONNECTION'].lower() == 'yes':
        return f"DRIVER={props['DRIVER']};SERVER={props['SERVER']};DATABASE={props['DATABASE']};Trusted_Connection=yes"
    else:
        return f"DRIVER={props['DRIVER']};SERVER={props['SERVER']};DATABASE={props['DATABASE']};UID={props['UID']};PWD={props['PWD']}"
