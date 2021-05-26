#!/bin/sh
npm --prefix /e2e install /e2e
/e2e/node_modules/.bin/cypress install --save-dev
(cd /e2e && npx cypress open --config baseUrl=http://$BASE_URL)
