pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                echo 'Clonando el repositorio...'
                git 'https://github.com/ActraStride/reactTest' // URL de tu repositorio
            }
        }

        stage('Build & Deploy') {
            steps {
                script {
                    echo 'Deteniendo contenedores antiguos...'
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} down" // Detiene y elimina los contenedores antiguos

                    echo 'Construyendo las nuevas imágenes...'
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} build" // Construye las imágenes

                    echo 'Levantando los nuevos contenedores...'
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} up -d" // Levanta los contenedores en segundo plano
                }
            }
        }
    }

    post {
        always {
            echo 'Limpiando el espacio de trabajo...'
            cleanWs() // Limpia el workspace después de cada ejecución
        }
    }
}