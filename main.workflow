workflow "example" {
  resolves = "plot"
  on = "push"
}

action "install dependencies" {
  uses = "jefftriplett/python-actions@master"
  args = "pip install -r ./requirements.txt"
}

action "matrix" {
    needs = "install dependencies"
    uses = "jefftriplett/python-actions@master"
    args = "python ./matrix.py"
}
action "plot" {
    needs = "matrix"
    uses = "jefftriplett/python-actions@master"
    args = "python ./plot.py"
}
