module Web.View.Comments.New where
import Web.View.Prelude

data NewView = NewView { comment :: Comment, todo :: Todo }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CommentsAction}>Comments</a></li>
                <li class="breadcrumb-item active">New Comment</li>
            </ol>
        </nav>
        <h1>New Comment for <q>{get #todo todo}</q></h1>
        {renderForm comment}
    |]

renderForm :: Comment -> Html
renderForm comment = formFor comment [hsx|
    {(hiddenField #todoId)}
    {(textField #author)}
    {(textareaField #comment) {helpText = "Markdown is enabled" }}
    {submitButton}
|]
