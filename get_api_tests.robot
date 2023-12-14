* Settings *
Resource    api_resource.resource


*** Test Cases ***
GET request to Comments endpoint
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /comments
    ${response}=  make GET call to endpoint /comments?postId=1
    ${response_item}=  get first item of response ${response}
    # compare two dicts, received from response and expected one. First the equality of
    # dictionaries' keys is checked and after that all the key value pairs
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_COMMENTS_RESPONSE}

GET request to Photos endpoint
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /photos
    ${response}=  make GET call to endpoint /photos
    ${response_item}=  get first item of response ${response}
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_PHOTOS_RESPONSE}

GET request to Posts endpoint
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /posts
    ${response}=  make GET call to endpoint /posts/1
    ${is int}=      Evaluate     isinstance(${response.json()}, list)
    Log To Console    ${is int}
    ${response_item}=  get first item of response ${response}
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_POSTS_RESPONSE}
#
GET request to Albums endpoint
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /albums
    ${response}=  make GET call to endpoint /albums
    ${response_item}=  get first item of response ${response}
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_ALBUMS_RESPONSE}

GET request to Todos endpoint
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /todos
    ${response}=  make GET call to endpoint /todos/1
    ${response_item}=  get first item of response ${response}
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_TODOS_RESPONSE}

GET request to Users endpoint
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /users
    ${response}=  make GET call to endpoint /users
    ${response_item}=  get first item of response ${response}
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_USERS_RESPONSE}


