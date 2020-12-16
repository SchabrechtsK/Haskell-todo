module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Comments
import Web.Controller.Todos
import Web.Controller.Static
instance FrontController WebApplication where
    controllers = 
        [ startPage TodosAction
        -- Generator Marker
        , parseRoute @CommentsController
        , parseRoute @TodosController
        ]

instance InitControllerContext WebApplication
