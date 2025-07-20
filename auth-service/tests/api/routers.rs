use crate::helpers::TestApp;

#[tokio::test]
async fn root_returns_auth_ui() {
    let app = TestApp::new().await;

    let response = app.get_root().await;

    assert_eq!(response.status().as_u16(), reqwest::StatusCode::OK);
    assert_eq!(response.headers().get("content-type").unwrap(), "text/html");
}


#[tokio::test]
async fn test_get_signup() {
    let app = TestApp::new().await;
    let response = app.get_signup().await;

    assert_eq!(response.status(), reqwest::StatusCode::OK);
}

#[tokio::test]
async fn test_get_login() {
    let app = TestApp::new().await;
    let response = app.get_login().await;

    assert_eq!(response.status(), reqwest::StatusCode::OK);
}

#[tokio::test]
async fn test_get_logout() {
    let app = TestApp::new().await;
    let response = app.get_logout().await;

    assert_eq!(response.status(), reqwest::StatusCode::OK);
}

#[tokio::test]
async fn test_get_verify_2fa() {
    let app = TestApp::new().await;
    let response = app.get_verify_2fa().await;

    assert_eq!(response.status(), reqwest::StatusCode::OK);
}

#[tokio::test]
async fn test_get_verify_token() {
    let app = TestApp::new().await;
    let response = app.get_verify_token().await;

    assert_eq!(response.status(), reqwest::StatusCode::OK);
}

