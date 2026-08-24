from flask import Flask, jsonify, request

app = Flask(__name__)

tasks = []
next_id = 1


@app.route("/tasks", methods=["GET"])
def get_tasks():
    return jsonify(tasks)


@app.route("/tasks", methods=["POST"])
def create_task():
    global next_id

    data = request.get_json()

    if not data or "title" not in data:
        return jsonify({"error": "O campo 'title' é obrigatório"}), 400

    task = {
        "id": next_id,
        "title": data["title"],
        "completed": False
    }

    tasks.append(task)
    next_id += 1

    return jsonify(task), 201


@app.route("/tasks/<int:task_id>", methods=["PUT"])
def update_task(task_id):
    data = request.get_json()

    for task in tasks:
        if task["id"] == task_id:
            if "title" in data:
                task["title"] = data["title"]

            if "completed" in data:
                task["completed"] = data["completed"]

            return jsonify(task)

    return jsonify({"error": "Tarefa não encontrada"}), 404


@app.route("/tasks/<int:task_id>", methods=["DELETE"])
def delete_task(task_id):
    for task in tasks:
        if task["id"] == task_id:
            tasks.remove(task)
            return jsonify({"message": "Tarefa removida com sucesso"})

    return jsonify({"error": "Tarefa não encontrada"}), 404


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)