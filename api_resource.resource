* Settings *
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary


* Variables *
${BASE_URL}    https://jsonplaceholder.typicode.com
&{EXPECTED_GET_PHOTOS_RESPONSE}=    albumId=${1}  id=${1}  title=accusamus beatae ad facilis cum similique qui sunt
...    url=https://via.placeholder.com/600/92c952  thumbnailUrl=https://via.placeholder.com/150/92c952
&{EXPECTED_GET_USERS_RESPONSE}=    id=${1}  name=Leanne Graham  username=Bret  email=Sincere@april.biz
...    address=${ADDRESS}  phone=1-770-736-8031 x56442  website=hildegard.org  company=${COMPANY}
&{ADDRESS}=    street=Kulas Light  suite=Apt. 556  city=Gwenborough  zipcode=92998-3874  geo=${GEO}
&{GEO}=    lat=-37.3159  lng=81.1496
&{COMPANY}=    name=Romaguera-Crona  catchPhrase=Multi-layered client-server neural-net
...    bs=harness real-time e-markets
&{EXPECTED_GET_COMMENTS_RESPONSE}=    postId=${1}  id=${1}  name=id labore ex et quam laborum  email=Eliseo@gardner.biz
...    body=laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium

*** Keywords ***
make GET call to endpoint ${endpoint}
    ${response}=  GET  url=${BASE_URL}${endpoint}
    [Return]     ${response}

get first item of response ${response}
    [documentation]  returns a first dict in the returned array.
    ...    if it is not array, the whole dict will be returned
    ${var_type}=      Evaluate     isinstance(${response.json()}, list)
    IF    ${var_type} == ${True}
    &{jsn_dict}=    Convert To Dictionary    ${response.json()[0]}
    ELSE
    &{jsn_dict}=    Convert To Dictionary    ${response.json()}
    END
    [Return]    &{jsn_dict}

make POST call to endpoint ${endpoint}
    [arguments]    ${body}
    &{header}=  Create Dictionary    Accept    application/json
    ${response}=  POST  url=${BASE_URL}${endpoint}  data=${body}  headers=${header}
    [Return]     ${response}

make PUT call to endpoint ${endpoint}
    [arguments]    ${body}
    &{header}=  Create Dictionary    Accept    application/json
    ${response}=  PUT  url=${BASE_URL}${endpoint}  data=${body}  headers=${header}
    [Return]     ${response}

make PATCH call to endpoint ${endpoint}
    [arguments]    ${body}
    &{header}=  Create Dictionary    Accept    application/json
    ${response}=  PATCH  url=${BASE_URL}${endpoint}  data=${body}  headers=${header}
    [Return]     ${response}

make DELETE call to endpoint ${endpoint}
    &{header}=  Create Dictionary    Accept    application/json
    ${response}=  Delete  url=${BASE_URL}${endpoint}
    [Return]     ${response}
