module Web.View.Todos.New where
import Web.View.Prelude

data NewView = NewView { todo :: Todo }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TodosAction}>Todos</a></li>
                <li class="breadcrumb-item active">New Todo</li>
            </ol>
        </nav>
        <h1>New Todo</h1>
        {renderForm todo}
    |]

renderForm :: Todo -> Html
renderForm todo = formFor todo [hsx|
    {(textField #todo)}
    {(textareaField #description) { helpText = "Markdown is enabled"}}
    {(checkboxField #completed)}
    {submitButton}
|]
