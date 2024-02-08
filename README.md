# spacetraders-v2-ts

A SpaceTraders V2 TypeScript SDK for the online programming game SpaceTraders.

For more information, please visit https://spacetraders.io/

## Using this SDK

### Installation

```sh
$ npm install @johanvanhelden/spacetraders-v2-ts --save
```

### Using the SDK

```ts
import { DefaultApi } from "@johanvanhelden/spacetraders-v2-ts";

const api = new DefaultApi();

api.getStatus()
    .then((response) => {
        const { data } = response;

        console.log(data);
    })
    .catch((error) => {
        console.error(error);
    })
    .finally(() => {
        console.info("All done!");
    });
```

## Building the SDK

These instructions are in order to build the SDK (for example to update the package).
If you are intending to simply use the SKD in your own project, you can skip this section.

### Requirements

-   Linux (either as an OS, VM or WSL2)
-   Docker (or Docker Desktop for Windows)
-   NVM

### Generating the SDK

In order to generate the SDK, simply run:

```sh
$ make sdk
```

To build the SDK:

```sh
$ make build
```

Make sure to revert any changes to the `README.md` and `package.json`.
And enter the new version number for the `package.json`.

### Publishing the package

Publishing is handled automatically through GitHub Actions upon creating a release.
