import pytest

from app import app, tasks


@pytest.fixture
def client():
    app.config["TESTING"] = True

    with app.test_client() as client:
        tasks.clear()
        yield client

    tasks.clear()


def test_get_tasks(client):
    response = client.get("/tasks")

    assert response.status_code == 200
    assert response.get_json() == []


def test_create_task(client):
    response = client.post(
        "/tasks",
        json={"title": "Estudar Docker"}
    )

    assert response.status_code == 201

    data = response.get_json()

    assert data["title"] == "Estudar Docker"
    assert data["completed"] is False


def test_update_task(client):
    create_response = client.post(
        "/tasks",
        json={"title": "Estudar Terraform"}
    )

    task_id = create_response.get_json()["id"]

    response = client.put(
        f"/tasks/{task_id}",
        json={"completed": True}
    )

    assert response.status_code == 200
    assert response.get_json()["completed"] is True


def test_delete_task(client):
    create_response = client.post(
        "/tasks",
        json={"title": "Estudar AWS"}
    )

    task_id = create_response.get_json()["id"]

    response = client.delete(f"/tasks/{task_id}")

    assert response.status_code == 200