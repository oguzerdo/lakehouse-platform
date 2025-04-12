# Lakehouse Platform

A modern data platform combining the flexibility of data lakes with the reliability of data warehouses, using Apache Iceberg, Nessie, and MinIO.

## Overview

This platform provides a complete lakehouse environment with versioning capabilities, S3-compatible object storage, and Apache Spark processing power, all accessible through a user-friendly Jupyter Notebook interface.

## Components

- **Apache Spark**: Fast, distributed data processing engine with Iceberg integration
- **Apache Iceberg**: High-performance table format for huge analytic datasets
- **Nessie**: Git-like versioning catalog for your data lake
- **MinIO**: S3-compatible object storage to store Iceberg data

## Quick Start

1. Clone this repository
2. Start the platform:
   ```
   docker-compose up -d
   ```
3. Access Jupyter Notebook at http://localhost:8888
4. Begin working with Iceberg tables using Nessie versioning

## Access Points

- **Jupyter Notebook**: http://localhost:8888
- **MinIO Console**: http://localhost:9001 (Login: admin/password)
- **Nessie API**: http://localhost:19120/api/v1

## Configuration

The platform is pre-configured with:

- S3 credentials (admin/password)
- Nessie catalog for Iceberg
- Pre-configured Spark settings for optimal Iceberg performance

## Data Persistence

All data is persisted using Docker volumes:

- `minio-data`: For your Iceberg table data
- `nessie-data`: For catalog metadata and version history

## Use Cases

- Data engineering and ETL workflows
- Versioned data analytics
- Data science experimentation with versioning
- Building data lakes with ACID transaction support
