* websockets using mq for b2b negotiable quote
* alternative GraphQL APIs (controllers)
* API for quote totals instead of working on new checkout API https://github.com/magento/architecture/pull/192
* using service contracts in graphQL
* design document regarding CSP
* import/export accepting all fields
* custom layout updates XML for pages is being validated only when created via adminpanel, not web API
* only session auth for GraphQL, can't work via cURL


===============Security
 
* Penetration testing every release? See about penetration modeling

## Researched
* standalone UI components without ACL validations? How is data loading via XHRs?
* Redirects to adminhtml from storefront/url generation. Solution - throw errors when admin routes are used in storefront area.
* Manual ACL processors to avoid requiring developers to put manual validations calls on every endpoint
* no ACL via GraphQL, might need for b2b sellers
* Import/export bypasses entity related ACLs
* Plugins for functional tests checking session ID presence and stuff???
* check RSS for exposing sensitive data/require proper authorization - declarative auth for RSS???
* entities via adminhtml accepting everything via setData()
* Check DTOs exposing sensitive data to web API
* audit bundled extensions

##Questionable
* standalone blocks processing user input, not validating ACL, not validating entity IDs ???
* emails exposure of all customers via webAPI/GraphQL/HTML?
* audit connectors, MBI whatever



=======Layout update
Update layout framework to get available handles.
Deprecate category/product's custom_layout_update attributes
