module Application.Helper.Controller (
    -- To use the built in login:
    -- module IHP.LoginSupport.Helper.Controller
    isMarkdown
) where

-- Here you can add functions which are available in all your controllers
import IHP.ControllerPrelude
-- To use the built in login:
-- import IHP.LoginSupport.Helper.Controller
import qualified Text.MMark as MMark

isMarkdown :: Text -> ValidatorResult
isMarkdown text =
    case MMark.parse "" text of
        Left _ -> Failure "Please provide valid Markdown"
        Right _ -> Success