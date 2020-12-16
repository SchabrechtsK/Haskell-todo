module Web.View.Todos.Index where
import Web.View.Prelude

data IndexView = IndexView { todos :: [Todo] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TodosAction}>Todos</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewTodoAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Todo</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach todos renderTodo}</tbody>
            </table>
        </div>
    |]


renderTodo todo = [hsx|
    <tr>
        <td><a href={ShowTodoAction (get #id todo)}>{get #todo todo}</a></td>
        <td><a href={EditTodoAction (get #id todo)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTodoAction (get #id todo)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
