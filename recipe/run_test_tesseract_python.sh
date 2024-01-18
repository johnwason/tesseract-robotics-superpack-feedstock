#!/bin/sh

set -e

export TESSERACT_SUPPORT_DIR=$CONDA_PREFIX/opt/tesseract_robotics/share/tesseract_support
export TESSERACT_RESOURCE_PATH=$CONDA_PREFIX/opt/tesseract_robotics/share
export TESSERACT_TASK_COMPOSER_DIR=$CONDA_PREFIX/opt/tesseract_robotics/share/tesseract_task_composer

echo TESSERACT_SUPPORT_DIR=$TESSERACT_SUPPORT_DIR

pytest -s
