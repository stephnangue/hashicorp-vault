/var/lib/pgsql/16/data/postgresql.conf

/etc/zitadel.env

/opt/zitadel/bin/zitadel

/etc/systemd/system/zitadel.service

the default user is root@zitadel.zitadel.openlab.net


{
    "allowed_redirect_uris": [
      "https://vault.openlab.net/ui/vault/auth/oidc/oidc/callback"
    ],
    "bound_claims": {
      "email": [
        "root@zitadel.zitadel.openlab.net"
      ]
    },
    "bound_claims_type": "string",
    "oidc_scopes": [
      "email"
    ],
    "token_policies": [
      "admin"
    ],
    "user_claim": "email"
}

hvs.YsvRlFfvF8xHLgsz9sRFjnXh
