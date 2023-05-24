from datetime import datetime, timedelta, timezone
from lib.db import db

class ShowActivity:
  sql = db.template('activities','show')
    results = db.query_object_json(sql,{
      'uuid': activity_uuid
    })
    return results