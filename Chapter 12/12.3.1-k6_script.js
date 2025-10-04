import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '2m', target: 100 },
    { duration: '5m', target: 100 },
    { duration: '2m', target: 0 },
  ],
};

export default function() {
  let res = http.get('http://my-eks-service.default.svc.cluster.local');
  check(res, { 'status was 200': (r) => r.status == 200 });
  sleep(1);
}
