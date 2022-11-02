port module Ports exposing (..)

import BrowserInfo exposing (BrowserInfoResponsePort, GetBrowserInfoPort)


port getBrowserInfoPort : GetBrowserInfoPort msg


port browserInfoResponsePort : BrowserInfoResponsePort msg
