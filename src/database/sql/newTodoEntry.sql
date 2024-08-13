-- Creates a new task
INSERT INTO tasks (
    title,
    description,
    due_date,
    completed,
    tags
) VALUES (?, ?, ?, ?, ?);
