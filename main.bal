import ballerina/http;
import ballerinax/wso2.controlplane as _;

service /hello on new http:Listener(9091) {

    resource function get sayHello() returns string {
        return "Hello, World!";
    }
    resource function get albums/[string title]/[string user]/[string...]() returns string|http:NotFound {
        return "Hello, World!";
    }
}
