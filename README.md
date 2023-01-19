# vue-cv

This project generates a CV following the [json resume schema](https://jsonresume.org/schema/) with some added extra data.

## Requirements

Node 8+ is required.

## How to use

### Serve the cv

First to compile the project:

```shell
npm install
```

After that, you can serve the content on `http://localhost:3000` and check the result using the browser:

```shell
npm run dev
```

The content can be changed by modifying the [data.yaml file](/data.yaml).

### Export the PDF

A file called `resume.pdf` can be generated with the data by running:

```shell
npm run pdf
```