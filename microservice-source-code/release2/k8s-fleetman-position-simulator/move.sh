#!/bin/bash

tracks_dir=~/k8s/modified-fleet/microservice-source-code/release2/k8s-fleetman-position-simulator/src/main/resources/tracks/
target_dir=~/k8s/modified-fleet/microservice-source-code/release2/k8s-fleetman-position-simulator/target
#pos_dir=~/k8s/modified-fleet/microservice-source-code/release2/k8s-fleetman-position-simulator

rm -rf "$tracks_dir"

echo "Cleaning tracks directory..."

mkdir "$tracks_dir" 2>/dev/null

cp ~/k8s/modified-fleet/microservice-source-code/release2/k8s-fleetman-position-simulator/src/main/resources/new_tracks/* "$tracks_dir"

echo "Done pulling data to tracks directory"

#######

rm -rf "$target_dir"

~/k8s/modified-fleet/microservice-source-code/release2/k8s-fleetman-position-simulator/mvnw clean package

