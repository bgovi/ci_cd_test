FROM node:20.11.1 as build

WORKDIR /usr/src/app

# Install tree

COPY ./client .
RUN npm install 
RUN npm run generate
RUN ls -la
RUN ls .output -la
RUN ls .output/public -la
RUN ls ./.output/public -la

# run step
FROM node:20.11.1 as rx
WORKDIR /usr/src/app



RUN npm install --global serve

EXPOSE 5000
# RUN ls ./ -la

# COPY --from=build ./dist ./
COPY --from=build ./.output/public ./

CMD ["serve", "-p", "5000"]