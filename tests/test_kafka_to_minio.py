# tests/test_kafka_to_minio.py
import importlib

def test_import_script():
    """
    Minimal test: can we import kafka_to_minio.py without errors?
    This will fail CI if there are syntax/import errors.
    """
    module = importlib.import_module("landing.kafka_to_minio")
    assert module is not None
