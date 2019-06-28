# docker-react-zxcvbn -- A Password Strength Tool 
This is an implementation of the Dropbox zxcvbn password strength meter in a web app format.   
The zxcvbn library is utilized within a create-react-app ReactJS environment.  
Web application is containerized with docker in a two-stage builder running NodeJS and NGINX.

A Dockerized zxcvbn implementation can be spun up on a docker-installed OS with one command:
- `sudo docker-compose -f ./docker-compose.yml up -d --build`

The web app consists of two elements:
1. dynamic form password strength meter rendered in the DOM
2. static div containing branding and password tips

# Getting Started
## Installation and management
> Project should be deployed via Azure DevOps or git-clone of latest master 
- `git clone -branch master <repository>`
- `For Azure DevOps Release and Deployment process - view relevant readme` 
> Container should be managed via docker-compose in deployed working directory  
- Rebuild and start container: 
    - `sudo docker-compose -f ./docker-compose.yml up -d --build`
- Kill existing container: 
    - `sudo docker kill react-zxcvbn`
- Remote access container: 
    - `sudo docker exec -it react-zxcvbn /bin/sh`



# Build and Test
Static HTML and CSS can be found in `./public/index.html` and `./src/index.css` respectively. The `./src/index.js` file contains the javascript responsible for React and dynamically rendering the ReactDOM. The `./src/style.css` file contains the CSS responsible for displaying the dynamically rendered content.

NGINX is configured within `./default.conf` and references certificates within `./crypto/*`. Configuration should match current TLS best practices.

Docker containers are managed within their default `./Dockerfile` and `./docker-compose.yml` locations. Applicable FROM and COPY entries are highlighted within below dependencies.

The `./public/manifest.json` and `./package.json` configurations maintain relevant application information and metadata. This should reflect current app design.

## Custom Dictionary
A default newline delimited password text file is contained at `./dictionary.txt`. This dictionary should contain only ACME relevant vocabulary, as zxcvbn maintains its own english language dictionaries. This dictionary **MUST** be copied over to the `custom_dict` javascript variable in `./src/index.js` in a comma delimited manner.

> var custom_dict = "summer,spring,ACME,AKME,perpetuity...


## Software dependencies
- docker image dependencies:
    - [NodeJS](https://hub.docker.com/_/node/)
    - [NGINX](https://hub.docker.com/_/nginx)  

- NPM install dependencies:
    - [create-react-app/react-scripts](https://github.com/facebook/create-react-app)
    - [react-dom](https://github.com/facebook/react/tree/master/packages/react-dom)
    - [zxcvbn](https://github.com/dropbox/zxcvbn)


# External Resources
- [zxcvbn public release](https://blogs.dropbox.com/tech/2012/04/zxcvbn-realistic-password-strength-estimation/)
- [zxcvbn whitepaper](https://www.usenix.org/conference/usenixsecurity16/technical-sessions/presentation/wheeler)

# Contribute
Branding and imagery should be taken from appropriate Advertising and Marketing team repositories.

All development efforts should be bound within the ACME Information Security DevOps repository and follow git best practices.

