# Seeds

Utility to generate the seeds.txt list that is compiled into the client
(see [src/chainparamsseeds.h](/src/chainparamsseeds.h) and other utilities in [contrib/seeds](/contrib/seeds)).

Be sure to update `PATTERN_AGENT` in `makeseeds.sh` to include the current version,
and remove old versions as necessary.

The seeds compiled into the release are created from chainz (cryptoid)' DNS seed data, like this:

    chmod +x ./contrib/seedds/makeseeds.sh && ./contrib/seedds/makeseeds.sh

## Dependencies

Ubuntu:

    sudo apt-get install python3-dnspython
