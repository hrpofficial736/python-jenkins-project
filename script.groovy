def build () {
    echo "Building app..."
}

def test () {
    echo "Testing app..."
}

def deploy () {
    echo "Deploying app..."
    echo "Deploying as ${params.Version}"
}

return this