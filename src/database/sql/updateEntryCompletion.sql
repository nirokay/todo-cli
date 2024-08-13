-- Marks an entry as completed or not
UPDATE tasks SET completed=? WHERE creation_timestamp=?;
