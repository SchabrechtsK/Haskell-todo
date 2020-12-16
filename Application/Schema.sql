-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE todos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    todo TEXT NOT NULL,
    completed BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE comments (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    todo_id UUID NOT NULL,
    author TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
ALTER TABLE comments ADD CONSTRAINT comments_ref_todo_id FOREIGN KEY (todo_id) REFERENCES todos (id) ON DELETE NO ACTION;
