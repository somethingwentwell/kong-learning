# kong_smtp

Deploys Kong EE DB mode with SMTP server

## Docker Image :

fake-smtp-server : https://hub.docker.com/r/reachfive/fake-smtp-server

## How to use

1. Just run `docker-compose up -d`

2. Try `Forgot Password` or invite new Admin with Kong Manager

3. Send request to `localhost:1080/api/emails` to check the email sent by Kong

```
[~] http :1080/api/emails                                                                                                                                                                                                                                     
HTTP/1.1 200 OK                                                                                                                                                                                                                                               
Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept                                                                                                                                                                                  
Access-Control-Allow-Origin: *                                                                                                                                                                                                                                
Connection: keep-alive                                                                                                                                                                                                                                        
Content-Length: 2135                                                                                                                                                                                                                                          
Content-Type: application/json; charset=utf-8                                                                                                                                                                                                                 
Date: Thu, 01 Jul 2021 08:35:50 GMT                                                                                                                                                                                                                           
ETag: W/"857-SIJMEy8Ehz1cmADERLeOyoe7No8"                                                                                                                                                                                                                     
X-Powered-By: Express                                                                                                                                                                                                                                         
                                                                                                                                                                                                                                                              
[                                                                                                                                                                                                                                                             
    {
        "attachments": [],
        "date": "2021-07-01T08:29:52.000Z",
        "from": {
            "html": "<span class=\"mp_address_group\"><a href=\"mailto:kongtest@gmail.com\" class=\"mp_address_email\">kongtest@gmail.com</a></span>",
            "text": "kongtest@gmail.com",

            }
            ]
        },
        "headerLines": [
            {
                "key": "content-type",
                "line": "Content-Type: multipart/mixed; boundary=\"--==_mimepart_1625128193.84916d12a64d6d43d7b4f92c14f4d217d15cada1\""
            },
            {
                "key": "subject",
                "line": "Subject: Password Reset Instructions for Kong Manager"
            },
            {
                "key": "message-id",
                "line": "Message-ID: <1625128192.363d3887b97693ac7cfdfb9d1bb8039eb259e379@localhost.localdomain>"
            },
            {
                "key": "mime-version",
                "line": "MIME-Version: 1.0"
            },
            {
                "key": "from",
                "line": "From: kongtest@gmail.com"
            },
            {
                "key": "date",
                "line": "Date: Thu, 01 Jul 2021 08:29:52 +0000"
            },
            {
                "key": "to",
                "line": "To: khairul.anuar@konghq.com"
            }
        ],
        "html": "      <p>Hello,</p>\n      <p>\n        Please click the link below to reset your Kong Manager password.\n      </p>\n      </p>\n        <a href=\"http://localhost:8002/account/reset-password?email=khairul.anuar%40konghq.com&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijg3Mzg2MjJhLWJlYzktNGZjZS04ZTJkLWEwNjc1MWFjNDU2YiIsImV4cCI6MTYyNTM4NzM5Mn0.LFYRVj7SwQBLnb0RdV6qzrvg7qtxhQV0Je2Jo5RT5x0\">http://localhost:8002/account/reset-password?email=khairul.anuar%40konghq.com&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijg3Mzg2MjJhLWJlYzktNGZjZS04ZTJkLWEwNjc1MWFjNDU2YiIsImV4cCI6MTYyNTM4NzM5Mn0.LFYRVj7SwQBLnb0RdV6qzrvg7qtxhQV0Je2Jo5RT5x0</a>\n      </p>\n      <p>\n        This link expires in 72 hours.\n      </p>\n      <p>\n      If you didn't make this request, keep your account secure by clicking the\n      link above to change your password.\n      </p>\n    ",
        "messageId": "<1625128192.363d3887b97693ac7cfdfb9d1bb8039eb259e379@localhost.localdomain>",
        "subject": "Password Reset Instructions for Kong Manager",
        "to": {
            "html": "<span class=\"mp_address_group\"><a href=\"mailto:khairul.anuar@konghq.com\" class=\"mp_address_email\">khairul.anuar@konghq.com</a></span>",
            "text": "khairul.anuar@konghq.com",
            "value": [
                {
                    "address": "khairul.anuar@konghq.com",
                    "name": ""
                }
            ]
        }
    }
]

```

## Additional feature





