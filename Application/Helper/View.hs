module Application.Helper.View (
    -- To use the built in login:
    -- module IHP.LoginSupport.Helper.View
    renderMarkdown
) where

-- Here you can add functions which are available in all your views
import IHP.ViewPrelude
-- To use the built in login:
-- import IHP.LoginSupport.Helper.View
import qualified Text.MMark as MMark

renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "No description to parse"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml