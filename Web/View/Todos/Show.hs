module Web.View.Todos.Show where
import Web.View.Prelude

data ShowView = ShowView { todo :: Include "comments" Todo }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TodosAction}>Todos</a></li>
                <li class="breadcrumb-item active">Show Todo</li>
            </ol>
        </nav>
        <h1>{get #todo todo}</h1>
        <p>{get #createdAt todo |> timeAgo}</p>
        <div>Completed: {get #completed todo}</div>
        <div>{get #description todo |> renderMarkdown}</div>

        <a href={NewCommentAction (get #id todo)}>Add Comment</a>
        <div>{forEach (get #comments todo) renderComment}</div>
    |]

renderComment comment = [hsx|
        <div class="mt-4">
            <h5>{get #author comment}</h5>
            <p>{get #comment comment |> renderMarkdown}</p>
        </div>
    |]