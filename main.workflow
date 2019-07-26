workflow "example" {
  resolves = "plot"
  on = "push"
}

action "install dependencies" {
  uses = "jefftriplett/python-actions@master"
  args = "pip install -r ./popper_demo/requirements.txt"
}

action "matrix" {
    needs = "install dependencies"
    uses = "jefftriplett/python-actions@master"
    args = "python ./popper_demo/matrix.py"
}
action "plot" {
    needs = "matrix"
    uses = "jefftriplett/python-actions@master"
    args = "python ./popper_demo/plot.py"
}
