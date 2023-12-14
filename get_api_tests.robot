* Settings *
Resource    api_resource.resource


*** Test Cases ***
GET request to Photos endpoint with list of resources
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the first item for endpoint /photos
    ${response}=  make GET call to endpoint /photos
    ${response_item}=  get first item of response ${response}
    # compare two dicts, received from response and expected one. First the equality of
    # dictionaries' keys is checked and after that all the key value pairs
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_PHOTOS_RESPONSE}

GET request to Users endpoint with specific resource
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    ...  and correctness of data returned for the specific item for endpoint /users
    ${response}=  make GET call to endpoint /users/1
    ${response_item}=  get first item of response ${response}
    Dictionaries Should Be Equal    ${response_item}    ${EXPECTED_GET_USERS_RESPONSE}


