**Contacts for Support**
- @rupertlssmith on https://elmlang.slack.com
- @rupert on https://discourse.elm-lang.org

# elm-browser-info

`elm-browser-info` provides a simple and minimal API for discovering information about
the browser code is running under.

# Setting up the javascript side and implementing the Elm ports

The javascript code is also available as an npm package. To install the npm 
package do:

    > npm install @the-sett/elm-browser-info

As packages with ports cannot be published, the types of the ports are defined
instead. It is up to the user of this package in an application to provide the
port implementations.

Add these port definitions to your Elm application:

```
port module Ports exposing (..)

import BrowserInfo exposing
    ( BrowserInfoResponsePort
    , GetBrowserInfoPort
    )

port getBrowserInfoPort : GetBrowserInfoPort msg


port browserInfoResponsePort : BrowserInfoResponsePort msg
```
