* Settings *
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary


* Variables *
${BASE_URL}    https://jsonplaceholder.typicode.com

&{EXPECTED_GET_POSTS_RESPONSE}=    userId=${1}  id=${1}  title=sunt aut facere repellat provident occaecati excepturi optio reprehenderit
...    body=quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto
&{EXPECTED_GET_COMMENTS_RESPONSE}=    postId=${1}  id=${1}  name=id labore ex et quam laborum  email=Eliseo@gardner.biz
...    body=laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium
&{EXPECTED_GET_PHOTOS_RESPONSE}=    albumId=${1}  id=${1}  title=accusamus beatae ad facilis cum similique qui sunt
...    url=https://via.placeholder.com/600/92c952  thumbnailUrl=https://via.placeholder.com/150/92c952
&{EXPECTED_GET_ALBUMS_RESPONSE}=    userId=${1}  id=${1}  title=quidem molestiae enim
&{EXPECTED_GET_TODOS_RESPONSE}=    userId=${1}  id=${1}  title=delectus aut autem    completed=${False}
&{EXPECTED_GET_USERS_RESPONSE}=    id=${1}  name=Leanne Graham  username=Bret  email=Sincere@april.biz
...    address=${ADDRESS}  phone=1-770-736-8031 x56442  website=hildegard.org  company=${COMPANY}
&{ADDRESS}=    street=Kulas Light  suite=Apt. 556  city=Gwenborough  zipcode=92998-3874  geo=${GEO}
&{GEO}=    lat=-37.3159  lng=81.1496
&{COMPANY}=    name=Romaguera-Crona  catchPhrase=Multi-layered client-server neural-net
...    bs=harness real-time e-markets

*** Keywords ***
make GET call to endpoint ${endpoint}
    [documentation]  make a request to the passed endpoint
    ${response}=  GET  url=${BASE_URL}${endpoint}
    Status Should Be  200  ${response}
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

