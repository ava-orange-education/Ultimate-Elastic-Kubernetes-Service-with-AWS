import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
    stages: [
        { duration: '3m', target: 50 },
        { duration: '5m', target: 50 },
        { duration: '2m', target: 100 },
        { duration: '1m', target: 0 },
    ],
};

export default function() {
    const response = http.get('http://your-eks-service/api/endpoint');
    
    check(response, {
        'is status 200': (r) => r.status === 200,
        'response time < 500ms': (r) => r.timings.duration < 500
    });
    
    sleep(1);
}
