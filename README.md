[![Run Status](https://api.shippable.com/projects/5f0cd6807d226f00069a33ae/badge?branch=master)]()

A library that generates an interactive radar, inspired by [thoughtworks.com/radar](http://thoughtworks.com/radar).

## Development

### Setup (Docker)

```
docker login docker.myob.com
vagrant up docker
vagrant ssh docker
```

### Setup (VirtualBox)

```
vagrant up virtualbox
vagrant ssh virtualbox
```

### Setup (Both VirtualBox and Docker)

```
docker login docker.myob.com
vagrant up
vagrant ssh [docker | virtualbox]
```

### Running Tests

```
vagrant ssh [docker | virtualbox]
cd /vagrant
./test.sh
```

### Build Docker Image

```
vagrant ssh [docker | virtualbox]
cd /vagrant
./build.sh
```

### Run Docker Container

```
vagrant ssh [docker | virtualbox]
cd /vagrant
./run.sh
```

Note: uses the `input.csv` file in the root directory of the repository.

## Setting Up Your Data

CSV with format as follows:

```
name,ring,quadrant,isNew,description
Composer,standard,tools,TRUE,"Although the idea of dependency management ..."
Canary builds,maintain,techniques,FALSE,"Many projects have external code dependencies ..."
Apache Kylin,trial,platforms,TRUE,"Apache Kylin is an open source analytics solution ..."
JSF,remove,languages & frameworks,FALSE,"We continue to see teams run into trouble using JSF ..."
```

Note: use the `input.csv` file in the root directory of the repository.

## Building You Radar

All tasks are defined in `package.json`.

Pull requests are welcome; please write tests whenever possible.
Make sure you have nodejs installed.

- `git clone git@github.com:thoughtworks/build-your-own-radar.git`
- `npm install`
- `npm test` - to run your tests
- `npm run dev` - to run application in localhost:8080. This will watch the .js and .css files and rebuild on file changes

To run End to End tests in headless mode
- add a new environment variable 'TEST_URL' and set it to 'http://localhost:8080/'
- `npm run end_to_end_test`

To run End to End tests in debug mode
- add a new environment variable 'TEST_URL' and set it to 'http://localhost:8080/'
- `npm run start`
- Click on 'Run all specs' in cypress window

### Don't want to install node? Run with one line docker

     $ docker run -p 8080:8080 -v $PWD:/app -w /app -it node:10.15.3 /bin/sh -c 'npm install && npm run dev'

***Note***: If you are facing Node-sass compile error while running, please prefix the command `npm rebuild node-sass` before `npm run dev`. like this
```
npm install && npm rebuild node-sass && npm run dev
```

After building it will start on `localhost:8080`
