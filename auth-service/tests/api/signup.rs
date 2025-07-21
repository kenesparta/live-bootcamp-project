use crate::helpers::TestApp;

#[tokio::test]
async fn test_get_signup() {
    let app = TestApp::new().await;
    let response = app.get_signup().await;

    assert_eq!(response.status(), reqwest::StatusCode::OK);
}
