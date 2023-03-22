from datetime import datetime, timedelta, timezone
from lib.ddb import Ddb
from lib.db import db

class MessageGroups:
  def run(user_handle):
    model = {
      'errors': None,
      'data': None
    }
    
    sql = db.template('users','uuid_from_handle')
    my_user_uuid = db.query_value(sql,{'handle': user_handle})

    print(f"UUID: {my_user_uuid}")

    ddb = Ddb.client()
    data = Ddb.list_message_groups(ddb, my_user_uuid)
    model['data'] = data
    return model