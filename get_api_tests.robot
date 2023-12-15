* Settings *
Resource    api_resource.resource


*** Test Cases ***
GET request to Photos endpoint with list of resources
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /photos
    ${response}=  make GET call to endpoint /photos
    Status Should Be  200  ${response}
    ${response_item}=  get first item of response ${response}
    # compare two dicts, received from response and expected one. First the equality of
    # dictionaries' keys is checked and after that all the key value pairs
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_PHOTOS_RESPONSE}

GET request to Users endpoint with specific resource
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the specific item for endpoint /users
    ${response}=  make GET call to endpoint /users/1
    Status Should Be  200  ${response}
    ${response_item}=  get first item of response ${response}
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_USERS_RESPONSE}

GET request to Comments endpoint with parameters in URL
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /comments
    ${response}=  make GET call to endpoint /comments?postId=1
    Status Should Be  200  ${response}
    ${response_item}=  get first item of response ${response}
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_COMMENTS_RESPONSE}


POST request to Photos endpoint with list of resources
    [documentation]  This test case verifies that the response code of the POST Request should be 200
    ...  and correctness of data returned
    ${body}=    Create Dictionary    title=TestTitle11  body=TestBody12  userId=15
    ${response}=  make POST call to endpoint /posts    ${body}
    Status Should Be  201  ${response}
    Dictionaries Should Be Equal    ${response.json()}    ${body}    ignore_keys=['id']

PUT request to Albums endpoint with list of resources
    [documentation]  This test case verifies that the response code of the PUT Request should be 200
    ...  and correctness of data returned
    ${body}=    Create Dictionary    id=${1}  title=TestTitle2  userId=2
    ${response}=  make PUT call to endpoint /posts/1    ${body}
    Status Should Be  200  ${response}
    Dictionaries Should Be Equal    ${response.json()}    ${body}

PATCH request to Photos endpoint with list of resources
    [documentation]  This test case verifies that the response code of the PATCH Request should be 200
    ...  and correctness of data returned
    ${body}=    Create Dictionary    id=${1}  title=TestTitle3  body=TestBody3  userId=3
    ${response}=  make PATCH call to endpoint /posts/1    ${body}
    Status Should Be  200  ${response}
    Dictionaries Should Be Equal    ${response.json()}    ${body}    ignore_keys=['id']

DELETE request to Photos endpoint with list of resources
    [documentation]  This test case verifies that the response code of the DELETE Request should be 200
    ${response}=  make DELETE call to endpoint /posts/1
    Status Should Be  200  ${response}
