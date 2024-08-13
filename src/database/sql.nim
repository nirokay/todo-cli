import db_connector/db_sqlite
import ../globals

template withDatabase*(db: untyped, body: untyped) =
    ## Template to simply work with the database
    let db: DbConn = database.open("", "", "")
    var success: bool = false
    db.exec(sql"BEGIN TRANSACTION")
    try:
        body
        success = true
    finally:
        try:
            if success:
                db.exec(sql"COMMIT")
                logger.log(lvlDebug, "Committed to database")
            else:
                logger.log(lvlDebug, "Not committing to database")
        except DbError as e:
            logger.log(lvlError, "Failed to commit to database")
        db.close()

